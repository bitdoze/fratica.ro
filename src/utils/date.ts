/**
 * Format a date to a human-readable string in Romanian
 * @param date The date to format
 * @returns Formatted date string (e.g., "26 februarie 2025")
 */
export function formatDate(date: Date): string {
  return new Intl.DateTimeFormat('ro-RO', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  }).format(date);
}
