let myOptional: String?

myOptional = nil

if myOptional != nil{
    let text: String = myOptional!
}
else{
    print("myOptional is nil")
}

if let safeOptional = myOptional{
    let text: String = safeOptional
    print(safeOptional)
}
else{
    print("myOptional is nil")
}


let text: String = myOptional ?? "is nil"
print(text)


struct MyOptional {
    var property = 123
    func method(){
        print("i am the structs method.")
    }
}

let mySt: MyOptional?

mySt = MyOptional()

print(mySt?.property)
