import allure
from src.PracticeTests.base.web_base import WebBaseClass


class TestWeb(WebBaseClass):
    @allure.title("Home page - smoke test")
    def test_homepage_title(self):
        self.driver.get("https://www.google.com")
        get_title = self.driver.title
        assert get_title =="google1"

    @allure.title("Home page - smoke test")
    def test_homepage_title1(self):
        self.driver.get("https://www.google.com")

    @allure.title("Home page - smoke test")
    def test_homepage_title12(self):
        self.driver.get("https://www.google.com")

    @allure.title("Home page - smoke test")
    def test_homepage_title13(self):
        self.driver.get("https://www.google.com")
