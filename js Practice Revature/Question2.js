// 2. Write a JavaScript program to compute the sum and product of an array of integers.

const arr = [1,2,3,4,5];

let sum = 0;
let prod = 1;
arr.forEach(i => {
    sum = sum + i;
    
});
arr.forEach(i => {
    prod = prod * i;
    
});
console.log("sum is : " + sum);
console.log("product is : " + prod);

