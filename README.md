# Environment Setup

## Available Environments
- **Development** - For local development
- **Staging** - For testing and QA
- **Production** - For live deployment

## Running the App

### Using VS Code
1. Open the Run and Debug panel (Ctrl+Shift+D)
2. Select your environment:
   - `Run Dev` - Development
   - `Run Staging` - Staging  
   - `Run Production` - Production
3. Click Run

### Using Command Line
```bash
# Development
flutter run --dart-define=ENV=development

# Staging
flutter run --dart-define=ENV=staging

# Production  
flutter run --dart-define=ENV=production