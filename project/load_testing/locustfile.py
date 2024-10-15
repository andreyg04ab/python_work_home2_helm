from locust import HttpUser, task


class TestUser(HttpUser):
    @task
    def user_ststus(self):
        self.client.get("/status/111333")
