async function login() {
  const username = document.getElementById("username").value;
  const password = document.getElementById("password").value;
  const errorDiv = document.getElementById("error");

  try {
    const response = await fetch("http://localhost:8080/auth/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ username, password })
    });

    if (!response.ok) {
      throw new Error("Usuário ou senha inválidos!");
    }

    const data = await response.json();

    // salva o token no localStorage
    localStorage.setItem("jwtToken", data.token);

    // redireciona para a página de CRUD de Rooms
    window.location.href = "rooms.html";
  } catch (err) {
    errorDiv.innerText = err.message;
  }
}
