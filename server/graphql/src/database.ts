type Foo = { id: string; text: string };

const foos: Record<string, Foo> = {
  'cdfda462-7fe0-4d15-ae38-164e92040f19': { id: 'cdfda462-7fe0-4d15-ae38-164e92040f19', text: 'bar' },
  '6728dbdc-8f47-444c-adc3-c9e707e2144a': { id: '6728dbdc-8f47-444c-adc3-c9e707e2144a', text: 'baz' },
};

// eslint-disable-next-line import/prefer-default-export
export { foos };
