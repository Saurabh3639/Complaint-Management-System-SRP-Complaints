function sendMail(params) {
    alert("Your feedback submitted sucessfully");
    var tempParams = {
        email: document.getElementById("email").value,
    };
    emailjs.send('service_huqe3jp','template_v0i62xd',tempParams)
            .then(function(res){
                alert("Your feedback submitted sucessfully");
                console.log("success", res.status);
            })
}

