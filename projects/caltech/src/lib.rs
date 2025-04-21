fn is_digit(ch: char) -> bool {
    ch == '0' || ch == '1' || ch == '2' ||
    ch == '3' || ch == '4' || ch == '5' ||
    ch == '6' || ch == '7' || ch == '8' ||
    ch == '9'
}

fn is_alphabet(ch: char) -> bool {
    (ch as u8 >= 65 && ch as u8 <= 90) || (ch as u8 >= 97 && ch as u8 <= 122)
}

fn is_valid_symbol(ch: char) -> bool {
    ch == '+' || ch == '-' || ch == '*' ||
    ch == '/' || ch == '!' || ch == '%' ||
    ch == '^' || ch == '&' || ch == '|' ||
    ch == '@' || ch == '_' || ch == '~'
}

pub mod caltech {
    pub type StringLateral = &'static str;
    pub type Functionptr = fn (f64, f64) -> Result<f64, StringLateral>;

    #[derive(Debug)]
    pub enum TokenKind {
        OPERATOR,
        INVALID,
        NUMBER,
        RPAREN,
        LPAREN,
        END,
    }

    pub enum Precedence {
        LOW,
        HIGH,
        INVALID,
    }

    pub struct Operator {
        pub function: Functionptr,
        pub precedence: Precedence,
        pub symbols: Vec<StringLateral>
    }

    pub type Operators = Vec<Operator>;

    pub enum Ast {
        Number(f64),
        Branch(Box<Ast>, String, Box<Ast>)
    }

    #[derive(Debug)]
    pub struct Token {
        pub token_kind: TokenKind,
        pub token_symbol: String
    }

    pub struct Parser {
        pub expression: String,
        pub operators: Operators
    }

    impl Parser {
        pub fn collect_tokens(&mut self) -> Result<Vec<Token>, String> {
            let mut position: usize = 0;
            let expression_length: usize = self.expression.len() - self.expression.chars().filter(|c| *c == '\n').count();
            let mut tokens: Vec<Token> = vec![];

            tokens.reserve(5);
            let mut push_token = |tk: TokenKind, ts: String| tokens.push(Token {
                token_kind: tk,
                token_symbol: ts,
            });

            let mut current_character: char = self.expression.chars().nth(position).unwrap();
            'main_loop: while position < expression_length {
                let mut number_or_operator =  String::new();
                if current_character == '(' {
                    push_token(TokenKind::LPAREN, current_character.to_string());
                    continue;
                } else if current_character == ')' {
                    push_token(TokenKind::RPAREN, current_character.to_string());
                    continue;
                } 

                // Collect number
                else if super::is_digit(current_character) || current_character == '.' {
                    loop {
                        number_or_operator.push(current_character);
                        position += 1;
                        if position >= expression_length { break; }
                        current_character = self.expression.chars().nth(position).unwrap();
                        if !super::is_digit(current_character) && current_character != '.' { break; }
                    }

                    push_token(TokenKind::NUMBER, number_or_operator);
                    continue;
                }


                // Check for operators
                else if super::is_alphabet(current_character) || super::is_valid_symbol(current_character) {
                    loop {
                        number_or_operator.push(current_character);
                        position += 1;
                        if position >= expression_length { break; }
                        current_character = self.expression.chars().nth(position).unwrap();
                        if !super::is_alphabet(current_character) && !super::is_valid_symbol(current_character) { break; }
                    }

                    for operator in &self.operators {
                        for symbol in &operator.symbols {
                            if number_or_operator == **symbol {
                                push_token(TokenKind::OPERATOR, number_or_operator);
                                continue 'main_loop;
                            }
                        }
                    }
                }
                let mut error_msg = String::from("ERROR: Encountered an invalid token ");
                error_msg.push(current_character);
                
                return Err(error_msg);
            }

            return Ok(tokens);
        }

        // fn parse(&self) -> Result<Ast, String> {
        //     let left_branch: Ast;
        //     let right_branch: Ast;
        // }
    }

}

fn main() {
    use caltech::*;
    let mut k = Parser {
        expression: "2222+1*3/2-1*69add3sub2mul5div2".to_string(),
        operators: vec![
            Operator { function: |a: f64, b: f64| Ok(a+b), precedence: Precedence::LOW, symbols: vec!["+", "add"] },
            Operator { function: |a: f64, b: f64| Ok(a-b), precedence: Precedence::LOW, symbols: vec!["-", "sub"] },
            Operator { function: |a: f64, b: f64| Ok(a*b), precedence: Precedence::LOW, symbols: vec!["*", "mul"] },
            Operator { function: |a: f64, b: f64| Ok(a/b), precedence: Precedence::LOW, symbols: vec!["/", "div"] },
        ]
    };

    let tokens: Vec<caltech::Token> = k.collect_tokens().unwrap();
    // println!("{:#?}", tokens);
    for token in &tokens {
        println!("-> {}", token.token_symbol);
    }
}

// #[cfg(test)]
// mod tests;
