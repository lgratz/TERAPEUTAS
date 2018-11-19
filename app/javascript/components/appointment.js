const setAppointments = () => {
  document.querySelectorAll('.appointment-time').forEach((link) => {link.addEventListener('click', (event) => {
    event.preventDefault();

    const clickedLink = event.currentTarget;
    const dateTime = clickedLink.dataset.datetime;

    let appointment_session_date = document.getElementById('appointment_session_date');
    appointment_session_date.value = dateTime;

    document.querySelectorAll('.hour').forEach((link)=>{link.classList.remove('hour')});
    clickedLink.classList.add('hour');
  })});
}

setAppointments();
