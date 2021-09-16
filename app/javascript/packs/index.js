document.getElementById("inputFile").addEventListener("change", disableButton)

function disableButton(){
    button = document.getElementById("submitFile")
    if (canSubmit()) {
        button.disabled = false
        button.className = "text-black p-2 rounded-md border-black border hover:bg-gray-300"
        return
    }
    button.disabled = true
    button.className = "text-gray-500 p-2 rounded-md border-gray-600 border"
}

function canSubmit(){
    file = document.getElementById("inputFile").value
    if (!(typeof file !== "undefined" && file === "")) {
        return true
    }
    return false
}