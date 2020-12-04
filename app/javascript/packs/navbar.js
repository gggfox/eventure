const events = document.getElementById("nav-events");
const users  = document.getElementById("nav-users");
const categories = document.getElementsByClassName("cate");
const currentLocation = location.href;

if (events.href == currentLocation){
    events.classList.add("active1");
}else{
    events.classList.remove("active1");
}

if (users.href == currentLocation){
    users.classList.add("active1");
}else{
    users.classList.remove("active1");
}

for(let i = 0; i<categories.length;i++){
    console.log(categories[i].href);
    if (categories[i].href == currentLocation){
        console.log("hurray");
        categories[i].classList.add("active1");
    }else{
        categories[i].classList.remove("active1");
    }
} 
