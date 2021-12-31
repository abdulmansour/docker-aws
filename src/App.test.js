import { render, screen } from '@testing-library/react';
import App from './App';

test('check for developer name', () => {
  render(<App />);
  const linkElement = screen.getByText(/Abdulrahim Mansour/i);
  expect(linkElement).toBeInTheDocument();
});
