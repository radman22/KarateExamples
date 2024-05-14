package NotificationService.feature.helper;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String randomEmail(){
        Faker faker = new Faker();
        return faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@test.com";

    }

    public static String  randomUsername(){
        Faker faker = new Faker();
        return faker.name().username();

    }

    public static String surname(){
        Faker faker = new Faker();
        return faker.name().nameWithMiddle();
    }


}
