
function transferField(someval) {
  document.myform.service1.value = someval;
  if (document.myform.service1.value != "") {
  document.myform.clear1.className = "showme";
    }
  }
function hideme() {
  document.myform.clear1.className = "hideme";
}

var hideClose = function () {
this.className = "hideme2";
}

function populateData(myInput,myValue,myClose) {
document.getElementById(myInput).value = myValue;
document.getElementById(myInput).className = "showme";
document.getElementById(myClose).className = "showme";
}
function populateDescribeData(myInput,myClose) {
myValue = document.getElementById('inputText060').value
document.getElementById(myInput).value = myValue;
document.getElementById(myInput).className = "showme";
document.getElementById(myClose).className = "showme";
}
function clearData(myInput) {
document.getElementById(myInput).value = "";
document.getElementById(myInput).className = "hideme2";
}


// REMOVE THIS FUNCTIONALITY AND REPLACE WITH JSON CONTROLLER
// HIGHLIGHT LEFT NAV CATEGORY SECTIONS & DISPLAYS ALL CONTENT FOR THAT SECTION
function openProb(evt, tabName) {
  var i, x, tablinks;
  document.getElementById('getstarted').style.display = "none";
  x = document.getElementsByClassName("hideme");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" probRed", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " probRed";
}



// // SC Dash accordion
// var acc = document.getElementsByClassName("accordion");
// var i;
//
// for (i = 0; i < acc.length; i++) {
//     acc[i].onclick = function(){
//         this.classList.toggle("active");
//         this.nextElementSibling.classList.toggle("show");
//   }
// }