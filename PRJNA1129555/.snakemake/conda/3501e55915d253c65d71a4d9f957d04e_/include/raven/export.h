
#ifndef RAVEN_EXPORT_H
#define RAVEN_EXPORT_H

#ifdef RAVEN_STATIC_DEFINE
#  define RAVEN_EXPORT
#  define RAVEN_NO_EXPORT
#else
#  ifndef RAVEN_EXPORT
#    ifdef raven_EXPORTS
        /* We are building this library */
#      define RAVEN_EXPORT 
#    else
        /* We are using this library */
#      define RAVEN_EXPORT 
#    endif
#  endif

#  ifndef RAVEN_NO_EXPORT
#    define RAVEN_NO_EXPORT 
#  endif
#endif

#ifndef RAVEN_DEPRECATED
#  define RAVEN_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef RAVEN_DEPRECATED_EXPORT
#  define RAVEN_DEPRECATED_EXPORT RAVEN_EXPORT RAVEN_DEPRECATED
#endif

#ifndef RAVEN_DEPRECATED_NO_EXPORT
#  define RAVEN_DEPRECATED_NO_EXPORT RAVEN_NO_EXPORT RAVEN_DEPRECATED
#endif

/* NOLINTNEXTLINE(readability-avoid-unconditional-preprocessor-if) */
#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef RAVEN_NO_DEPRECATED
#    define RAVEN_NO_DEPRECATED
#  endif
#endif

#endif /* RAVEN_EXPORT_H */
