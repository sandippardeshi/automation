# AWS SES Template Management with CLI

This repository contains instructions on how to manage AWS SES (Simple Email Service) templates using the AWS CLI (Command Line Interface). It includes steps for creating, updating, and deleting SES templates, along with verifying the changes.

## Prerequisites

Before you begin, ensure you have the following:

- AWS CLI installed and configured with appropriate IAM permissions.
- Basic understanding of AWS SES and JSON syntax.

## 1. Creating AWS SES Templates

Follow these steps to create a new AWS SES template:

1. Create a JSON file containing the template details. For example, create a file named `template_name.json` with the required parameters:

    ```json
    {
      "TemplateName": "Verification",
      "SubjectPart": "{{env}}Welcome to MyApp, {{user}}!",
      "HtmlPart": "<p>Dear {{user}},</p><p>Welcome to MyApp!</p><p>Best regards,</p><p>The MyApp Team</p>"
    }
    ```

2. Run the following AWS CLI command to create the template:

    ```bash
    aws ses create-template --cli-input-json file://template_name.json
    ```

## 2. Updating Existing AWS SES Templates

Follow these steps to update an existing AWS SES template:

1. Create a JSON file containing the updated template details. For example, create a file named `updated_template_name.json` with the updated HTML content:

    ```json
    {
      "Template": {
        "TemplateName": "Verification",
        "SubjectPart": "{{env}}Welcome to MyApp, {{user}}!",
        "HtmlPart": "<p>Dear {{user}},</p><p>Welcome to MyApp!</p><p>Your account is now active.</p><p>Best regards,</p><p>The MyApp Team</p>"
      }
    }
    ```

2. Run the following AWS CLI command to update the template:

    ```bash
    aws ses update-template --cli-input-json file://updated_template_name.json
    ```

## 3. Deleting AWS SES Templates

Follow these steps to delete an existing AWS SES template:

1. Run the following AWS CLI command to delete the template. Replace `TEMPLATE_NAME` with the name of the template you want to delete:

    ```bash
    aws ses delete-template --template-name TEMPLATE_NAME
    ```

## 4. Verifying Changes

After updating or deleting a template, you can verify the changes by listing templates or getting the details of the updated template:

- To list all templates:

    ```bash
    aws ses list-templates
    ```

- To get details of a specific template:

    ```bash
    aws ses get-template --template-name TEMPLATE_NAME
    ```

## Note

- Ensure you replace placeholders such as `TEMPLATE_NAME` with the actual names of your templates.
- Always ensure that you have appropriate permissions to perform operations on AWS SES templates. Make sure your IAM user or role has the necessary permissions attached.
- Exercise caution when creating, updating, or deleting SES templates, as these actions can have immediate effects on your email communication.
- Before executing any AWS CLI commands, double-check the input parameters and verify the changes to avoid unintended consequences.
- Regularly review and update your SES templates to ensure they comply with your organization's branding guidelines and legal requirements.
