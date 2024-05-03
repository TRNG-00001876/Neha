// Write a JavaScript program that accepts a number as input and inserts dashes (-) between each even number. For example if you accept 025468 the output should be 0-254-6-8.

let userInput = "025468";
let ans = "";

for(let i = 0; i<userInput.length; i++){
    if(parseInt(userInput[i])%2 ==0 && parseInt(userInput[i+1])%2==0){
        ans+=(parseInt(userInput[i]))+'-';
    }else{
        ans+=(parseInt(userInput[i]));
    }
    


}
console.log(ans);
