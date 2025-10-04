# Part 3 — QA Tooling & Process Improvements

I looked at the four areas mentioned in the task and thought about what would actually help in practice.  
The tools and processes I’m suggesting are a mix of things I’ve used before in projects and things I researched to see what other game/tech teams rely on.  
The idea is to keep it practical, nothing over-engineered, just solutions that solve real problems.
---

## 1. Automated test data generation for armies/tokens
**Problem**: Setting up armies/tokens by hand eats time and makes tests flaky because the data isn’t always consistent.  

**Tool / Approach**: **Faker (Python/JS)** + a small wrapper script or service.  
- Faker is widely used for generating realistic but fake data (names, IDs, numbers).  
- We can extend it to create predefined armies/tokens via API calls.  
- The script can reset the test environment before runs.  

**Why this tool**: It’s lightweight, easy to integrate into both manual regression and automated pipelines, and most devs already know how to use it.  

**Impact**: Saves time, reduces “bad test data” bugs, makes Part 2 regression cases repeatable.

---

## 2. Reporting dashboard for API and game logic tests
**Problem**: When backend tests fail, the logs are hard to parse. Non-QA folks (PMs, designers) don’t get visibility.  

**Tool / Approach**: **Allure Test Report** (open source).  
- Integrates well with most test frameworks (Pytest, JUnit, Cypress).  
- Generates clear HTML reports with history, graphs, and attachments (logs/screenshots).  
- Can be published as a static site after every CI run.  

**Why this tool**: It’s widely adopted in Europe, minimal setup, and adds almost no friction to devs.  

**Impact**: Makes failures obvious, gives everyone the same view of test status, and speeds up bug triage.

---

## 3. CI/CD integration for Unity builds
**Problem**: Manual Unity builds slow down testing. Bugs sometimes only show up in certain build configs.  

**Tool / Approach**: **GameCI (Unity Builder GitHub Action)**.  
- Open-source project designed specifically for automating Unity builds in CI.  
- Works with GitHub Actions, GitLab CI, Jenkins.  
- Can generate test builds for different platforms (Windows, Android, iOS) automatically.  

**Why this tool**: It’s the go-to choice for Unity automation in CI/CD. Teams like Ubisoft and indie devs alike use it.  

**Impact**: Developers always get a fresh test build on every merge. QA can run regression tests on the exact binary that will ship.

---

## 4. Flaky test detection and alerting
**Problem**: Some tests fail randomly (timing, async events in Unity). This reduces trust in automation.  

**Tool / Approach**: **Flaky Test Handler + CI retry strategy**.  
- **Jenkins Flaky Test Handler plugin** if using Jenkins.  
- Or **GitHub Actions workflow** with `retry-on-failure` plus a Slack/Teams alert.  
- Mark tests as “flaky” automatically if they pass on rerun, and track frequency.  

**Why this tool**: No new framework needed — it plugs directly into CI. Gives QA visibility into which tests are unreliable.  

**Impact**: Reduces noise, helps the team focus only on real failures, and builds confidence in automation.

---

## Final note
I chose these because they’re widely adopted, low effort to set up, and they directly solve the common problems in the areas that assignment mentioned.
