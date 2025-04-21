use super::caltech::*;

#[test]
fn it_works() {
    let operators = Operators::default();

    let operators = Operators (vec![
        Operator {function: |a: f64, b: f64| a+b, precedence: Precedence::LOW, names: vec!["+"]},
        Operator {function: |a: f64, b: f64| a-b, precedence: Precedence::LOW, names: vec!["-"]},
        Operator {function: |a: f64, b: f64| a*b, precedence: Precedence::LOW, names: vec!["*"]},
        Operator {function: |a: f64, b: f64| a/b, precedence: Precedence::LOW, names: vec!["/"]},
    ]);

    caltech::init_calc(&operators, "2+3");
    println!("{operators:?}");

    // let result = caltech::evaluate(&String::from("2+3"));
    // assert_eq!(result, 4.00);
}
