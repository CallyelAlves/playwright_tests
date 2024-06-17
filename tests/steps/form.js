const { Given, When, BeforeAll, Then } = require('@cucumber/cucumber');
const { chromium, expect } = require('@playwright/test');

var page = "";

BeforeAll(async () => {
    const browser = await chromium.launch({ headless: true });
    const context = await browser.newContext();
    page = await context.newPage();
});

async function handleAlert(page, expectedMessage) {
    page.on('dialog', async dialog => {
      expect(dialog.message()).toBe(expectedMessage);
      await dialog.accept();
    });
}

Given('que eu estou na página de formulário', async function () {
    const url = 'https://practice-automation.com/form-fields/';
    return await page.goto(url);
});

When('eu preencho o campo Name com {string}', async function (string) {
    return await page.fill('[data-cy="name"]', string);
});

When('eu seleciono Coffee como bebida favorita', async function () {
    return await page.check('[data-cy="drink3"]');
});

When('eu seleciono Blue como cor favorita', async function () {
    return await page.check('[data-cy="color2"]');
});

When('eu seleciono {string} no campo Você tem algum irmão?', async function (string) {
    return await page.selectOption('[data-cy="siblings"]', string);
});

When('eu preencho o campo email com {string}', async function (string) {
    return await page.fill('[data-cy="email"]', string);
});

When('eu preencho o campo Message com Essa é uma mensagem de teste.', async function () {
    return await page.fill('[data-cy="message"]', 'Essa é uma mensagem de teste.');
});

When('eu clico em Submit', async function () {
    return await page.click('[data-cy="submit-btn"]');
});

Then('eu devo ver a mensagem Form submitted successfully!', async function () {
    return await handleAlert(page, 'Message received!');
});