#!/bin/sh
PRIMARY_COLOR="${OVERRIDE_PRIMARY_COLOR:-#0d6efd}"
SECONDARY_COLOR="${OVERRIDE_SECONDARY_COLOR:-#0a58ca}"
LOGO_URL="${OVERRIDE_LOGO_URL:-//beyond-bot.ai/cdn/shop/files/B-Bot-Logo_3.svg}"

cat > /web/dist/custom.css <<EOF
:root {
  /* Set primary colors to match bootstrap */
  --ak-accent: ${PRIMARY_COLOR};
  --ak-dark-foreground-link: ${SECONDARY_COLOR};
  --ak-dark-foreground: #000000;
  --pf-global--primary-color--100: ${PRIMARY_COLOR};
  --pf-global--primary-color--200: ${SECONDARY_COLOR};
  --pf-global--primary-color--400: ${PRIMARY_COLOR};
  
  /* Change background to white */
  --ak-flow-background: none !important;
  --pf-c-login__main--BackgroundColor: #ffffff;
  --pf-c-login__container--BackgroundColor: #ffffff;
  --ak-dark-background: #ffffff;
  --ak-dark-background-light: #f8f9fa;
}

/* Override dark theme settings */
body, ak-flow-executor, ak-loading, ak-message-container {
  color: #212529 !important;
  background-color: #ffffff !important;
  theme: light !important;
}

/* Main container styling */
.pf-c-login__main {
  background-color: #ffffff !important;
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
  border-radius: 1rem !important;
  backdrop-filter: none !important;
}

/* Remove blur effects */
.pf-c-login__main::before,
.pf-c-login__footer .pf-c-list::before,
.pf-c-page__sidebar::before {
  display: none !important;
}

/* Form elements styling to match bootstrap */
.pf-c-form-control {
  display: block;
  width: 100%;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #212529;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 1rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

/* Button styling to match bootstrap */
.pf-c-button.pf-m-primary {
  color: #fff;
  background-color: ${PRIMARY_COLOR};
  border-color: ${PRIMARY_COLOR};
  border-radius: 1rem;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  user-select: none;
}

.pf-c-button.pf-m-primary:hover {
  background-color: ${SECONDARY_COLOR};
  border-color: ${SECONDARY_COLOR};
}

/* Link buttons */
.pf-c-button.pf-m-link {
  color: ${PRIMARY_COLOR};
  background-color: transparent;
  border: none;
  padding: 0.375rem 0.75rem;
  border-radius: 1rem;
}

.pf-c-button.pf-m-link:hover {
  color: ${SECONDARY_COLOR};
  background-color: transparent;
  text-decoration: underline;
}

/* Login container */
.ak-login-container {
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 2rem;
  background-color: #f8f9fa;
}

/* Brand logo */
.ak-login-container .ak-brand img {
  content: url("${LOGO_URL}");
  max-width: 200px;
  height: auto;
  margin: 0 auto;
  display: block;
}

/* Login header */
.pf-c-login__header {
  margin-bottom: 1.5rem;
}

/* Fix for dark text on dark background */
.pf-c-login__main-body {
  color: #212529;
}

/* Hide footer if desired */
.pf-c-login__footer {
  display: none;
}

/* Consistent border radius for all elements */
.pf-c-dropdown__menu, 
.pf-c-dropdown__toggle, 
.pf-c-select__menu, 
.pf-c-select__toggle,
.pf-c-form-control,
.pf-c-button:not(.pf-m-link) {
  border-radius: 1rem !important;
}

.pf-c-background-image {
    --pf-c-background-image--BackgroundColor: var(--pf-global--BackgroundColor--dark-100);
    --pf-c-background-image--BackgroundImage: url(https://cdn.shopify.com/s/files/1/0795/1653/3018/files/Your_B-Bot_Me_2_9b15acd6-1ffd-42de-9dc9-95ef3a50c262.png?v=1705335292) !important;
    --pf-c-background-image--BackgroundImage-2x: url(https://cdn.shopify.com/s/files/1/0795/1653/3018/files/Your_B-Bot_Me_2_9b15acd6-1ffd-42de-9dc9-95ef3a50c262.png?v=1705335292) !important;
    --pf-c-background-image--BackgroundImage--sm: url(https://cdn.shopify.com/s/files/1/0795/1653/3018/files/Your_B-Bot_Me_2_9b15acd6-1ffd-42de-9dc9-95ef3a50c262.png?v=1705335292) !important;
    --pf-c-background-image--BackgroundImage--sm-2x: url(https://cdn.shopify.com/s/files/1/0795/1653/3018/files/Your_B-Bot_Me_2_9b15acd6-1ffd-42de-9dc9-95ef3a50c262.png?v=1705335292) !important;
    --pf-c-background-image--BackgroundImage--lg: url(https://cdn.shopify.com/s/files/1/0795/1653/3018/files/Your_B-Bot_Me_2_9b15acd6-1ffd-42de-9dc9-95ef3a50c262.png?v=1705335292) !important;
    --pf-c-background-image--Filter: url(#image_overlay);
}

EOF

ak server
