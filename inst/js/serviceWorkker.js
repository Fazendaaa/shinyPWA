self.addEventListener('install', installEvent => {
    installEvent.waitUntil(
        caches.open(websiteVersion).then(cache => {
            cache.addAll('/');
        })
    )
})
