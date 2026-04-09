/**
 * Form submission handler — agnostic endpoint via env vars.
 * Anti-spam: honeypot field.
 * Validation: HTML5 native + JS custom.
 */

interface FormResult {
  success: boolean;
  error?: string;
}

export async function submitForm(
  form: HTMLFormElement,
  endpoint: string
): Promise<FormResult> {
  // Honeypot check — if filled, silently discard
  const honeypot = form.querySelector<HTMLInputElement>('[name="website"]');
  if (honeypot && honeypot.value) {
    // Fake success to confuse bots
    return { success: true };
  }

  // Collect form data as JSON
  const formData = new FormData(form);
  const data: Record<string, string> = {};

  formData.forEach((value, key) => {
    if (key !== 'website') { // Exclude honeypot
      data[key] = value.toString();
    }
  });

  try {
    const response = await fetch(endpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify(data),
    });

    if (response.ok) {
      return { success: true };
    } else {
      return { success: false, error: 'server' };
    }
  } catch {
    return { success: false, error: 'network' };
  }
}

/**
 * Validate phone number (FR/international)
 */
export function isValidPhone(phone: string): boolean {
  const cleaned = phone.replace(/[\s\-\.]/g, '');
  // FR mobile: 06/07 + 8 digits, or +33 6/7 + 8 digits, or international
  return /^(\+?33|0)[67]\d{8}$/.test(cleaned) || /^\+\d{10,15}$/.test(cleaned);
}

/**
 * Initialize form with submit handler, validation, and UI feedback
 */
export function initForm(
  formId: string,
  endpoint: string,
  options: {
    onSuccess?: () => void;
    onError?: (error: string) => void;
    successMessageId?: string;
    errorMessageId?: string;
    submitButtonId?: string;
  } = {}
) {
  const form = document.getElementById(formId) as HTMLFormElement;
  if (!form) return;

  form.addEventListener('submit', async (e) => {
    e.preventDefault();

    const submitBtn = options.submitButtonId
      ? document.getElementById(options.submitButtonId) as HTMLButtonElement
      : form.querySelector('button[type="submit"]') as HTMLButtonElement;

    // Loading state
    if (submitBtn) {
      submitBtn.disabled = true;
      submitBtn.setAttribute('aria-busy', 'true');
      submitBtn.classList.add('opacity-70');
    }

    // Custom phone validation
    const phoneInput = form.querySelector<HTMLInputElement>('input[type="tel"]');
    if (phoneInput && phoneInput.value && !isValidPhone(phoneInput.value)) {
      phoneInput.setCustomValidity('Invalid phone number');
      phoneInput.reportValidity();
      if (submitBtn) {
        submitBtn.disabled = false;
        submitBtn.removeAttribute('aria-busy');
        submitBtn.classList.remove('opacity-70');
      }
      return;
    }

    const result = await submitForm(form, endpoint);

    if (result.success) {
      // Show success message
      const successEl = options.successMessageId
        ? document.getElementById(options.successMessageId)
        : null;
      if (successEl) {
        successEl.classList.remove('hidden');
        successEl.classList.add('fade-slide-down');
      }
      form.reset();
      options.onSuccess?.();
    } else {
      // Show error message
      const errorEl = options.errorMessageId
        ? document.getElementById(options.errorMessageId)
        : null;
      if (errorEl) {
        errorEl.classList.remove('hidden');
        errorEl.classList.add('shake');
        setTimeout(() => errorEl.classList.remove('shake'), 300);
      }
      options.onError?.(result.error || 'unknown');
    }

    // Reset button
    if (submitBtn) {
      submitBtn.disabled = false;
      submitBtn.removeAttribute('aria-busy');
      submitBtn.classList.remove('opacity-70');
    }
  });
}
