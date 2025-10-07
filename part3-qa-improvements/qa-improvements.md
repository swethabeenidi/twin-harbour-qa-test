# Part 3 — QA Tooling & Process Improvements

- I looked at the four areas mentioned in the task and thought about what would actually help in practice.  
- The tools and processes I’m suggesting are a mix of things I’ve used before in projects and things I researched to see what other game/tech teams rely on.  
- The idea is to keep it practical, nothing over-engineered, just solutions that solve real problems.

---

## 1. Automated test data generation for armies/tokens
**What could be the problem**: Setting up armies/tokens test data manually consumes much time and makes tests flaky because the data isn’t always consistent.
**Tool / Approach**: **Faker (Python/JS)** + a small wrapper script or service.  
- Faker is widely used for generating realistic but fake data (names, IDs, numbers).  
- We can extend it to create predefined armies/tokens via API calls.  
- The script can reset the test environment before runs.  

**Why this tool**: It’s easy to integrate into both manual regression and automated pipelines, and popular among devs and they might already know how to use it.  

---

## 2. Reporting dashboard for APItests  

**Tool / Approach**: **Allure Test Report** (open source).  
- Integrates well with most test frameworks (Pytest, JUnit, Cypress).  
- Generates clear HTML reports with history, graphs, and attachments (logs/screenshots).  

**Why this tool**: It’s widely adopted in Europe, minimal setup,  Makes clear failure reports

---

## 3. CI/CD integration for Unity builds

**Tool / Approach**: **GameCI (Unity Builder GitHub Action)**.  
- Open-source project designed specifically for automating Unity builds in CI.  
- Works with GitHub Actions, GitLab CI, Jenkins.  
- Can generate test builds for different platforms (Windows, Android, iOS) automatically.  

**Why this tool**: It’s the go-to choice for Unity automation in CI/CD. Teams like Ubisoft and indie devs alike use it.  
Developers always get a fresh test build on every merge. QA can run regression tests

---

## 4. Flaky test detection and alerting

**Tool / Approach**: **Jenkins Flaky Test Handler plugin** and **GitHub Actions workflow**
- **Jenkins Flaky Test Handler plugin** if using Jenkins.  
- Or **GitHub Actions workflow** with `retry-on-failure` plus a Slack/Teams alert.  
- Mark tests as “flaky” automatically if they pass on rerun

**Why this tool**: No new framework needed — it plugs directly into CI. Gives QA visibility into which tests are not reliable.  

---

## Final note
I chose these because they’re widely adopted, low effort to set up, and they directly solve the common problems in the areas that assignment mentioned.
