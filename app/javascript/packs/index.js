document.getElementById("inputFile").addEventListener("change", disableButton)

function disableButton(){
    button = document.getElementById("submitFile")
    if (canSubmit()) {
        button.disabled = false
        button.className = "text-black"
        return
    }
    button.disabled = true
    button.className = "text-grey-300"
}

function canSubmit(){
    file = document.getElementById("inputFile").value
    if (!(typeof file !== "undefined" && file === "")) {
        return true
    }
    return false
}