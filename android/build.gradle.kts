allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

subprojects {
    // ใช้ plugins.withId เพื่อรอให้ Android Plugin โหลดเสร็จก่อนค่อยทำงาน
    plugins.withId("com.android.application") {
        configureAndroidNamespace(project)
    }
    plugins.withId("com.android.library") {
        configureAndroidNamespace(project)
    }
}

// ฟังก์ชันช่วยตั้งค่า namespace
fun configureAndroidNamespace(project: Project) {
    val android = project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
    android?.apply {
        if (namespace == null) {
            // ถ้า group ว่าง ให้ใช้ชื่อโปรเจกต์แทน เพื่อป้องกัน error
            namespace = if (project.group.toString().isNotEmpty()) project.group.toString() else "com.example.${project.name.replace("-", ".")}"
        }
    }
}