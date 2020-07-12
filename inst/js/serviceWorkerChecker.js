if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        navigator.serviceWorker
            .register('js/serviceWorker.js')
            .then(console.log('service worker registered'))
            .catch(err => console.log('service worker not registered. Reason: ', err))
    })
}
