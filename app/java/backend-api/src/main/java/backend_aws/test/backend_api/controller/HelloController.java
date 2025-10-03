package backend_aws.test.backend_api.controller;

import org.springframework.web.bind.annotation.*;
import java.time.Instant;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class HelloController {

    @GetMapping("/health")
    public Map<String, Object> health() {
        return Map.of("status", "ok", "at", Instant.now().toString());
    }

    @GetMapping("/hello/{name}")
    public Greeting hello(@PathVariable String name) {
        return new Greeting("Hola " + name + " 👋", Instant.now().toString());
    }


    record Greeting(String message, String at) {}
}
