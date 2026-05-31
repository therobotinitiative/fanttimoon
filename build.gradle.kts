plugins {
  id ("com.avast.gradle.docker-compose") version "0.17.6"
}

dockerCompose {
    // Use .set(listOf(...)) for Kotlin DSL compatibility
    useComposeFiles.set(listOf("docker-compose.yml"))
    
    // Optional: Since your .env is in the same folder, 
    // the plugin usually finds it, but you can be explicit:
    environment.set(mapOf("COMPOSE_PROJECT_NAME" to "fanttimoon"))
}
