



function spanishget(word) {
    var spanish ;
    const myArray = word.split("#");
    spanish = myArray[0]
    console.log(spanish)
    return spanish
}

function englishget(word) {
    var english;
    const myArray = word.split("#");
    english = myArray[1]
    console.log(english)
    return english
}

function compare(eng,trial){
    if(eng===trial){
        return 1
    }
    else{
        return 0
    }
}
