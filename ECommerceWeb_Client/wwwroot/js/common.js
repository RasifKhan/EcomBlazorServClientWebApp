window.ShowToastr = (type, message) => {
    if (type === "success") {
        toastr.success(message, "Operation Successfull", { timeOut: 5000 });
    }



    if (type === "error") {
        toastr.error(message, "Operation failed", { timeOut: 5000 });
    }
}

function ShowDeleteConfirmationModal() {
    $('#deleteConfirmationModal').modal('show');
}


function HideDeleteConfirmationModal() {
    $('#deleteConfirmationModal').modal('hide');
}


