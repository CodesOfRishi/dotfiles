# **Breaking Changes (`BREAKING CHANGE`)**

- **Purpose**: Introduce changes that break backward compatibility, requiring users to make adjustments to their code.
- **Example**:

```plaintext
feat!: remove support for legacy API endpoints

BREAKING CHANGE: The old API endpoints have been removed and replaced with new versions.
```

A **breaking change** refers to a modification in a software system that alters its behavior in a way that existing functionality, dependencies, or integrations are no longer compatible. This means that after the change is implemented, some or all parts of the code, applications, or services that depend on the previous behavior may fail or require modification to continue working.

### Common scenarios for breaking changes:
1. **API Changes**: Removing, renaming, or altering the behavior of functions, methods, or endpoints that existing clients rely on.
2. **Interface Modifications**: Changing the structure of an interface or class that other parts of the code or external services depend on.
3. **Data Format Changes**: Modifying the format of inputs, outputs, or database schemas, rendering older data incompatible.
4. **Configuration Changes**: Updating configuration options in a way that older configurations no longer function or are recognized.
5. **Removal of Deprecated Features**: Removing functions or options that were previously deprecated but still in use by older systems.

### Example:
If a library function used to return data in a specific format (e.g., JSON) but is changed to return data in a different format (e.g., XML), this would be a breaking change for users who expect JSON.

### Significance:
- **Compatibility**: Clients or other services need to adapt their code.
- **Versioning**: Breaking changes typically warrant a major version increase, following semantic versioning (e.g., moving from version 2.x to 3.x).

Breaking changes often need clear documentation, advance notice, and sometimes a migration plan to help users update their dependencies or codebases.
