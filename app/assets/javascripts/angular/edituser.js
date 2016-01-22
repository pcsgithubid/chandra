function editUser() {
    $.ajax({
        type: "get",
        url: "/users/new"
    });
}