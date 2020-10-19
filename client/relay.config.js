module.exports = {
  src: "./src",
  schema: "./schema.graphql",
  artifactDirectory: "./src/__generated__",
  // You can add type definitions for custom scalars here.
  // Whenever a custom scalar is encountered, the type emitted will correspond to the definition defined here. You can then deal with the type as needed when accessing the data.
  customScalars: {
    DateTime: "string"
  },
};
