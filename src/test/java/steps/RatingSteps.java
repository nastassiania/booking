package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.testng.Assert;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$$;

public class RatingSteps {
    String actualRating;

    @Given("User is doing search in {string} city")
    public void userIsDoingSearchInLondonCity(String city) {
        BookingSteps search = new BookingSteps();
        search.userIsLookingForHotelInLondonCity(city);
        search.userDoesSearch();
    }

    @When("User gets the {string} hotel rating")
    public void userGetsTheJuzzHolidayLetsHotelRating(String hotel) {
        actualRating = $(By.xpath(String.format("//div[@data-testid='title'][contains(text(), '%s')]//ancestor::div[@class='b978843432']//div[@class='b5cd09854e d10a6220b4']", hotel)))
                .getText();
    }

    @Then("The rating of the hotel is {string}")
    public void theRatingOfTheHotelIs(String expectedRating) {
        Assert.assertEquals(actualRating, expectedRating);
    }
}
