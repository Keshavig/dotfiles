include stdlib [[ Gives read and print ]]

type sn = {
    string a := "Your name here.."
    int a := 0
};

func sqrt(a: int, b: string) {
    L : lamda = [](a: int, b: int) => (a+b)

    for (int a := 1..10) {
        int value := L(a, a*a)
        if (a % 2 == 2) => println("Welcome to my city")
    }
}

func main(argc: int, argv: string[]) => |void| {
    int a := 0

    print("Enter a number: ")
    read(|a|)

    print(sqrt(a))
}
