// eslint-disable-next-line import/no-extraneous-dependencies
import { GraphQLID, GraphQLList, GraphQLNonNull, GraphQLObjectType, GraphQLSchema, GraphQLString } from 'graphql';
import { foos } from './database';

const fooType = new GraphQLObjectType({
  name: 'Foo',
  fields: {
    id: { type: GraphQLID },
    text: { type: GraphQLNonNull(GraphQLString) },
  },
});

const queryType = new GraphQLObjectType({
  name: 'Query',
  fields: {
    foo: {
      type: fooType,
      args: {
        id: { type: GraphQLString },
      },
      resolve: (_, { id }) => {
        return foos[id];
      },
    },
    foos: {
      type: GraphQLList(fooType),
      resolve: () => {
        return Object.values(foos);
      },
    },
  },
});

const schema = new GraphQLSchema({ query: queryType });

export default schema;
