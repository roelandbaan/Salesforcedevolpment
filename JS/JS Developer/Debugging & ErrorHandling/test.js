async function abc(){
    let promise = new Promise((resolve,reject)=>{
        setTimeout(() => resolve('hello'), 1000)
    })
    console.log('start2');
    let greeting = await promise;
    console.log('end');
}
abc().then(data => console.log(data));