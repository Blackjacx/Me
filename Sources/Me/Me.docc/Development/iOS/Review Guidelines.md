# Review Guidelines

Good practices for code reviews that have been battle-tested in real projects over years.

## Rules

1. All targets must be able to create a new build. Verify this automatically by checking your CI pipeline. If you don't have it, it's recommended to implement one. 
2. The <doc:Swift-Best-Practices> must match.
3. If you found a typo, not only mark the line and comment "Here is a typo" but also add your suggestion for what you think is correct. Additionally remember the PR author to enable spell checking in Xcode which helps to avoid typos in PR reviews.
4. As a PR author never close conversations yourself. This should be done by the one who created the comment. It is similar to merging PRs which also has to be decided/done by the reviewer and not the PR author.
5. Find code duplicates and suggest alternatives.
6. Find code that's hard to understand and suggest alternatives.
7. Find code that's complicated (or not needed).
8. Find code that depends too much on other code and suggest alternatives.
9. Find code that can't be replaced easily and create a ticket to resolve that problem.
