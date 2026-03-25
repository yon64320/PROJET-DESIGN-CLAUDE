export default {
  name: 'processStep',
  title: 'Étape du process',
  type: 'document',
  fields: [
    {
      name: 'order',
      title: 'Numéro d\'étape',
      type: 'number',
      validation: (Rule: any) => Rule.required().min(1).max(10),
    },
    {
      name: 'title',
      title: 'Titre de l\'étape',
      type: 'string',
      validation: (Rule: any) => Rule.required(),
    },
    {
      name: 'description',
      title: 'Description',
      type: 'text',
      rows: 3,
      validation: (Rule: any) => Rule.required(),
    },
    {
      name: 'deliverable',
      title: 'Livrable',
      type: 'string',
      validation: (Rule: any) => Rule.required(),
    },
    {
      name: 'clientTime',
      title: 'Temps demandé au client',
      type: 'string',
      description: 'Ex: "1h", "30 min", "—"',
      validation: (Rule: any) => Rule.required(),
    },
    {
      name: 'clientFormat',
      title: 'Format client',
      type: 'string',
      description: 'Ex: "1 session", "asynchrone", "1 round de retours"',
    },
    {
      name: 'duration',
      title: 'Durée de l\'étape',
      type: 'string',
      description: 'Ex: "3 jours ouvrés", "1 semaine"',
    },
  ],
  orderings: [
    {
      title: 'Ordre',
      name: 'orderAsc',
      by: [{ field: 'order', direction: 'asc' }],
    },
  ],
}
