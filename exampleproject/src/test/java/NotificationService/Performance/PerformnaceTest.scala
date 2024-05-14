package Performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerformnaceTest extends Simulation {

  val protocol = karateProtocol()

     protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
     protocol.runner.karateEnv("staging")

  val addToCart = scenario("Add and delete to cart").exec(karateFeature("classpath:NotificationService/Performance/CartEndpoints/CartCalls.feature"))

  setUp(
    addToCart.inject(
        atOnceUsers(3)
        // nothingFor(5),
        // rampUsers(5).during(5),
        // constantUsersPerSec(10).during(5)
        ).protocols(protocol)
  )

}