



function spanishget(word) {
    var spanish ;
    const myArray = word.split(",");
    spanish = myArray[0]
    console.log(spanish)
    return spanish
}

function englishget(word) {
    var english;
    const myArray = word.split(",");
    english = myArray[1]
    console.log(english)
    return english
}

function finalScore(points,total){
    var ans;
    ans = Math.round((points/total)*100)
    return ans
}
