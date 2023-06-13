function validateForm()
 {
 var un = document.registration.uname.value;
 var u  = document.registration.lname.value;
 var m = document.registration.mob.value;
 var mail = document.registration.mail.value;
 var ma = document.registration.pass.value;

 if(un=="" || un=="null")
 {
    alert("please enter your first name");
    document.registration.uname.focus();
    return false;
 }
 if(u =="" || u =="null")
 {
    alert("please enter your last name");
    document.registration.lname.focus();
    return false;
 }
 if(m =="" || m=="null")
 {
    alert("please enter your mobile no");
    document.registration.mob.focus();
    return false;
 }
 if(ma =="" || ma=="null")
 {
    alert("please enter your password");
    document.registration.pass.focus();
    return false;
 }
 
 

 if(mail=="" || mail=="null")
 {
    alert("please enter your email");
    document.registration.mail.focus();
    return false;
 }
    var atpos = mail.indexOf("@");
    var dotpos = mail.lastIndexOf(".");
 if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= mail.length)
 {
    alert("Not a valid e-mail address");
    return false;
 }
    alert("Registration successfull");
    return true;
 }
