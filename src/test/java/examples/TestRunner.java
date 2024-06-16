package examples;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testExamples()
    {
        return Karate.run("DELETECalldeleteuser").relativeTo(getClass());
    }
}
