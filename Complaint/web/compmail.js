function sendMail(params) {
        alert("Your Complaint submitted sucessfully");
    var tempParams = {
        email: document.getElementById("email").value,
    };
    emailjs.send('service_7acwgfb','template_0ozkg5u',tempParams)
            .then(function(res){
                console.log("success", res.status);
            })
}

