document.getElementById("inputFile").addEventListener("change", disableButton)

function disableButton(){
    button = document.getElementById("submitFile")
    if (canSubmit()) {
        button.disabled = false
        return
    }
    button.disabled = true
}

function canSubmit(){
    file = document.getElementById("inputFile").value
    if (!(typeof file !== "undefined" && file === "")) {
        return true
    }
    return false
}