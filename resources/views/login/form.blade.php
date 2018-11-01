<legend>Login Form</legend>

<form method="post" action="{{ url('auth') }}">
    User ID : <input type="text" name="userid">
    <br>
    Password : <input type="password" name="password">
    <br>
    <input type="submit" value="Login">
</form>