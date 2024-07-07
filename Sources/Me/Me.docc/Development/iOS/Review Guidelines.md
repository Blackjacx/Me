# Review Guidelines

Good practices for code reviews that have been battle-tested in real projects over years.

## Rules

1. All targets must be able to create a new build. Verify this automatically by checking your CI pipeline. If you don't have it, it's recommended to implement one. 
1. The <doc:Swift-Best-Practices> must match.
1. If you have found a typo, copy the sentence, paste it in the GitHub comment and mark the typo using **bold** font. This makes it easier for the reviewer to find them if is e.g. a single word. Additionally remember the PR author to enable spell checking in Xcode which helps to avoid typos in PR reviews.
1. As a PR creator please never close the conversations. This should be done by the one who created the feedback/conversation. It is similar to merging PRs which also has to be decided/done by the reviewer and not the PR creator.
1. Find code duplicates and suggest alternatives.
1. Find code that's hard to understand and suggest alternatives.
1. Find code that's complicated (or not needed).
1. Find code that depends too much on other code and suggest alternatives.
1. Find code that can't be replaced easily and create a ticket to resolve that problem.

