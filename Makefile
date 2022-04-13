.PHONY: help print

help:
	@echo "Run make with:"
	@echo " > run-all-tests			...to run all tests using Docker Compose"
	@echo " > run-only-web-tests			...to run only web tests using Docker Compose"
	@echo " > tests-cleanup			...to remove undesired files after a tests execution."
	@echo " > run-tests-and-clean   ...call the run-all-tests and tests-cleanup rules."
	@echo " > run-only-web-tests-and-clean   ...call the run-only-web-tests and tests-cleanup rules."

run-all-tests:
	@echo "Creating a docker-compose..."
	@docker-compose -f "docker-compose-dockerfile.yml" up -d --build
	@ - docker compose -f "docker-compose-dockerfile.yml" exec pytest bash -c "python -m pytest tests --remote --host chrome  --alluredir=allure-results"
	@echo "All tests are run."

run-only-web-tests:
	@echo "Creating a docker-compose..."
	@docker-compose -f "docker-compose-dockerfile.yml" up -d
	@sleep 3
	@ - docker compose -f "docker-compose-dockerfile.yml" exec pytest bash -c "pytest tests/ui/web --remote --host chrome  --alluredir=allure-results"
	@echo "Web tests are run."

tests-cleanup:
	@echo Containers used for the project will be removed now.
	@docker container stop "pytest"
	@docker compose down && docker system prune -f --volumes
	@echo All unused containers are removed.

run-all-tests-and-clean:run-all-tests tests-cleanup
run-only-web-tests-and-clean:run-only-web-tests  tests-cleanup


.DEFAULT_GOAL := help
