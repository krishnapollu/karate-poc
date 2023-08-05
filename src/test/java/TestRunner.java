

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate.Test;
import static org.junit.jupiter.api.Assertions.*;


public class TestRunner {
	
	@Test
    public void testWithReport() {
        Results result = Runner
                    .path("classpath:feature/")
                    .parallel(5);
        assertEquals(0, result.getFailCount(), result.getErrorMessages());
    }
}
