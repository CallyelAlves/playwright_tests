// @ts-check
const { test, expect } = require('@playwright/test');
const url = 'https://practice-automation.com/form-fields/';

async function handleAlert(page, expectedMessage) {
  page.on('dialog', async dialog => {
    expect(dialog.message()).toBe(expectedMessage);
    await dialog.accept();
  });
}

test('Preencher formulário com dados válidos', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Zé');
  await page.check('[data-cy="drink3"]'); // Coffee
  await page.check('[data-cy="color2"]'); // Blue
  await page.selectOption('[data-cy="siblings"]', 'yes');
  await page.fill('[data-cy="email"]', 'zedelas@example.com');
  await page.fill('[data-cy="message"]', 'Essa é uma mensagem de teste.');
  await page.click('[data-cy="submit-btn"]');
  await handleAlert(page, 'Message received!');
});

test('Submeter formulário sem preencher campo obrigatório "Name"', async ({ page }) => {
  await page.goto(url);
  await page.check('[data-cy="drink2"]');
  await page.check('[data-cy="color1"]');
  await page.selectOption('[data-cy="siblings"]', 'no');
  await page.fill('[data-cy="email"]', 'zedelas@example.com');
  await page.fill('[data-cy="message"]', 'Essa é uma mensagem de teste.');
  
  await page.click('[data-cy="submit-btn"]');
  await expect(page.locator('[data-cy="name"]')).toHaveAttribute('required');
});

test('Selecionar múltiplas bebidas favoritas', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Maria');
  await page.check('[data-cy="drink1"]');
  await page.check('[data-cy="drink4"]');
  await page.check('[data-cy="color4"]');
  await page.selectOption('[data-cy="siblings"]', 'maybe');
  await page.fill('[data-cy="email"]', 'maria@example.com');
  await page.fill('[data-cy="message"]', 'Essa é uma mensagem de teste.');
  
  await page.click('[data-cy="submit-btn"]');
  await handleAlert(page, 'Message received!');
});

test('Submeter formulário com email inválido', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Invalid Email Tester');
  await page.check('[data-cy="drink2"]');
  await page.check('[data-cy="color2"]');
  await page.selectOption('[data-cy="siblings"]', 'no');
  await page.fill('[data-cy="email"]', 'invalid-email');
  await page.fill('[data-cy="message"]', 'Testing invalid email format.');
  
  await page.click('[data-cy="submit-btn"]');
  await handleAlert(page, 'Message received!');
});

test('Verificar preenchimento automático de siblings', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Carol');
  await page.selectOption('[data-cy="siblings"]', 'no');
  await expect(page.locator('[data-cy="siblings"]')).toHaveValue('no');
});

test('Submeter formulário sem selecionar bebida favorita', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Marcos');
  await page.check('[data-cy="color5"]'); // Pink
  await page.selectOption('[data-cy="siblings"]', 'yes');
  await page.fill('[data-cy="email"]', 'marquin@example.com');
  await page.fill('[data-cy="message"]', 'Mensagem sem bebida favorita.');
  
  await page.click('[data-cy="submit-btn"]');
  await handleAlert(page, 'Message received!');
});

test('Submeter formulário sem selecionar cor favorita', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Bia');
  await page.check('[data-cy="drink2"]');
  await page.selectOption('[data-cy="siblings"]', 'maybe');
  await page.fill('[data-cy="email"]', 'Bia@example.com');
  await page.fill('[data-cy="message"]', 'Sem escolher a cor favorita.');
  
  await page.click('[data-cy="submit-btn"]');
  await handleAlert(page, 'Message received!');
});

test('Submeter formulário com mensagem longa', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Ana');
  await page.check('[data-cy="drink3"]');
  await page.check('[data-cy="color2"]');
  await page.selectOption('[data-cy="siblings"]', 'no');
  await page.fill('[data-cy="email"]', 'ana@example.com');
  await page.fill('[data-cy="message"]', 'Essa é uma mensagem extensa. '.repeat(20));
  
  await page.click('[data-cy="submit-btn"]');
  await handleAlert(page, 'Message received!');
});

test('Submeter formulário com todos os campos não preenchidos', async ({ page }) => {
  await page.goto(url);
  await page.click('[data-cy="submit-btn"]');
  await expect(page.locator('[data-cy="name"]')).toHaveAttribute('required');
});

test('Submeter formulário com todos os campos preenchidos corretamente e múltiplas bebidas favoritas selecionadas', async ({ page }) => {
  await page.goto(url);
  await page.fill('[data-cy="name"]', 'Carlos');
  await page.check('[data-cy="drink1"]');
  await page.check('[data-cy="drink3"]');
  await page.check('[data-cy="color1"]');
  await page.selectOption('[data-cy="siblings"]', 'yes');
  await page.fill('[data-cy="email"]', 'carlos@example.com');
  await page.fill('[data-cy="message"]', 'Mensagem teste com varias bebidas.');
  
  await page.click('[data-cy="submit-btn"]');
  await handleAlert(page, 'Message received!');
});