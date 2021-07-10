package poc;

import com.intuit.karate.junit5.Karate;

public class TestSuite {

    @Karate.Test
    Karate testSample() {
        return Karate.run("FlightOperation").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("tags").tags("@second").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:poc/flights/FlightOperation.feature");
                //.tags("@second")
                //.karateEnv("e2e")
                //.systemProperty("foo", "bar");
    }
}
