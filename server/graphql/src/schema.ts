// eslint-disable-next-line import/no-extraneous-dependencies
import { GraphQLID, GraphQLList, GraphQLNonNull, GraphQLObjectType, GraphQLSchema, GraphQLString } from 'graphql';
import { foos } from './database';
import { sleep } from './utils';

const fooType = new GraphQLObjectType({
  name: 'Foo',
  fields: {
    id: { type: GraphQLNonNull(GraphQLID) },
    text: { type: GraphQLNonNull(GraphQLString) },
  },
});

const queryType = new GraphQLObjectType({
  name: 'Query',
  fields: {
    foo: {
      type: fooType,
      args: {
        id: { type: GraphQLNonNull(GraphQLID) },
      },
      resolve: async (_, { id }) => {
        await sleep(5000);
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
