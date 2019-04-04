date();
function date(){
document.getElementById('user_crdate').value= new Date().toISOString().slice(0, 10);
}